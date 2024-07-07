<?php

namespace App\Traits;

use ReflectionClass;
use ReflectionMethod;

trait HasCrud
{
    public function indexTraits($model, array $with = [], array $columns = ['*'])
    {
        if (empty($with)) {
            return $model::select($columns)->get();
        } else {
            return $model::with($with)->select($columns)->get();
        }
    }
    
    public function storeTraits($model, $data)
    {
        $model::create($data);
        return $this->indexTraits($model);
    }

    public function loadRelations($model, array $relations)
    {
        return $model->load($relations);
    }

    public function showTraits($model, $identifier)
    {
        return $model::where('id', $identifier)
            ->orWhere('slug', $identifier)
            ->firstOrFail();
        
    }

    public function updateTraits($model, $id, $data)
    {
        $record = $model::findOrFail($id);
        $record->update($data);
        return $this->indexTraits($model);
    }

    public function destroyTraits($model, $id)
    {
        $record = $model::findOrFail($id);
        $record->delete();
        return $this->indexTraits($model);
    }
}