<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Models\Pet;
use Faker\Generator as Faker;

$factory->define(Pet::class, function (Faker $faker) {
    $gender = ['Male', 'Female'];

    return [
        'name' => $faker->firstName(),
        'nickname' => $faker->lastName(),
        'gender' => $gender[array_rand($gender)],
        'birthday' => $faker->date(),
        'weight' => rand(50, 250),
        'height' => rand(50, 250),
        'color' => $faker->colorName(),
        'friendly' => boolval(array_rand([0, 1])),
    ];
});
