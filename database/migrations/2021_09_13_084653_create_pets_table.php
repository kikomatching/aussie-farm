<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePetDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pets', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('pet_type_id');

            $table->string('name')->unique();
            $table->string('nickname')->nullable()->default('');
            $table->enum('gender', ['Male', 'Female', ''])->nullable()->default('');
            $table->date('birthday');
            
            $table->float('weight')->unsigned();
            $table->float('height')->unsigned();
            $table->string('color')->nullable()->default('');
            $table->boolean('friendly')->default(false);

            $table->timestamps();

            $table->foreign('pet_type_id')->references('id')->on('pets');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('pet_details');
    }
}
