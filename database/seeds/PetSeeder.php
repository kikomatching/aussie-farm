<?php

use App\Models\Pet;
use App\Models\PetType;
use Illuminate\Database\Seeder;

class PetSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if (PetType::exists()) {
            return;
        }

        factory(PetType::class)
            ->create([
                'name' => 'Kangaroo',
            ])
            ->each(function($type) {
                $type->pets()->createMany(
                    factory(Pet::class, 30)->make()->toArray()
                );
            });
    }
}
