<?php

namespace Leo\Products\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithCalculatedFormulas;
use Illuminate\Support\Str;
use Leo\Products\Models\Products;

class ProductImport implements ToCollection,WithCalculatedFormulas
{
    /**
    * @param Collection $collection
    */
    public function collection(Collection $rows)
    {
        foreach ($rows as $key => $row) {
            if ($key==0  || $row->isEmpty()) {
                continue;
            }
            $data =[
                'name'=>$row[1],
                'slug'=>Str::slug($row[1]),
                'price'=>$row[2],
                'discount'=>$row[3],
                'content'=>$row[8],
                'status'=>0,
                'idCate'=>$row[6],
                'idBrand'=>$row[5],
            ];
            Products::create($data);
        }
    }
}
