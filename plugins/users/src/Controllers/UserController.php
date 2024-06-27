<?php

namespace Leo\Users\Controllers;

use App\Traits\HasCrud;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Leo\Users\Mail\createUser;
use Leo\Users\Models\User;
use Leo\Users\Requests\StoreRequest;
use Leo\Users\Requests\UpdateRequest;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Leo\Roles\Models\Roles;
use Tymon\JWTAuth\Facades\JWTAuth;
use Firebase\JWT\JWT;
use Inertia\Inertia;

class UserController
{
    protected $model;

    use HasCrud;
    public function __construct()
    {
        $this->model = User::class;
    }

    public function index()
    {
        $users = $this->model::with('roles')->get();
        $roles= Roles::all();
        return Inertia::render('Users/Index', [
            'users' => $users,
            'roles' => $roles,
        ]);
    }

    public function login(Request $request){
        $request->session()->invalidate(); 
        $request->session()->regenerateToken();
        return Inertia::render('Login/Signin');
    }

    public function store(StoreRequest $request)
    {
        $data = $request->all();
        $password = random_int(10000, 99999);
        $data['password'] = Hash::make($password);
        User::create($data);
        $data = [
            'email' => $request->email,
            'password' => $password,
        ];
        Mail::to($request->email)->send(new createUser($data));
        return response()->json(['check' => true]);
    }

    public function show($identifier)
    {
        $result= $this->showTraits($this->model, $identifier);
        return response()->json($result);
    }

    public function switchUser($identifier){
        $user = $this->model::find($identifier);
        $status=$user->status;
        if($status==0){
            $data['status']=1;
        }else{
            $data['status']=0;
        }
        $this->updateTraits($this->model, $identifier, $data);
        $users = $this->model::with('roles')->get();
        return response()->json(['check'=>true,'data'=>$users],200);
    }

    public function update(UpdateRequest $request,$id)
    {
        $result= $this->updateTraits($this->model, $id, $request->all());
        $result =$this->model::with('roles')->get();
        return response()->json(['check'=>true,'data'=>$result], 200);
    }

    public function destroy($identifier)
    {
        $result= $this->destroyTraits($this->model, $identifier);
        if(count($result)>0){
            return response()->json(['check'=>true,'result'=>$result]);
        }
        return response()->json(['check'=>true]);
    }

    public function checkLogin (Request $request, User $user){
        $validator = Validator::make($request->all(), [
            'email'=>'required|email|exists:users,email',
            'password'=>'required'
        ]);
        if ($validator->fails()) {
            return response()->json(['check'=>false,'msg'=>$validator->errors()->first()]);
        }
        if(Auth::attempt(['name'=>$request->name,'password'=>$request->password,'status'=>1],true)){
            $user = User::where('email',$request->email)->first();
            $request->session()->put('user', $user);
            $request->session()->regenerate();
            return response()->json(['check'=>true]);
        }else{
            return response()->json(['check'=>false,'msg'=>'Tài khoản không hợp lệ']);
        }
    }

    public function checkLogin2 (Request $request, User $user){
        $validator = Validator::make($request->all(), [
            'email'=>'required|email|exists:users,email',
        ]);
        if ($validator->fails()) {
            return response()->json(['check'=>false,'msg'=>$validator->errors()->first()]);
        }
        $user = User::where('email',$request->email)->first();
        $token = JWTAuth::fromUser($user);
        $idRole = $user->idRole;
        $roles = Role::with('permission')->where('id',$idRole)->get();
        foreach ($roles as $role) {
            foreach ($role->permission as $permission) {
                $permissionArray[] = $permission->name;
            }
        }
        $jwtPayload = $permissionArray;
        $jwtSecret = env('JWT_SECRET');
        $algorithm = 'HS256';
        $permissionArray= JWT::encode($jwtPayload, $jwtSecret, $algorithm);
        return response()->json([
                'check' => true,
                'token' => $token,
                'permission'=>$permissionArray
        ]);
    }

    public function logout()
    {
        Auth::logout();
        return redirect('/');
    }
    /**
     * Display the specified resource.
     */
    public function refresh()
    {
        return response()->json([
            'status' => 'success',
            'user' => Auth::user(),
            'authorisation' => [
                'token' => Auth::refresh(),
                'type' => 'bearer',
            ]
        ]);
    }
}
