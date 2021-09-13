<?php

namespace App\Services\ResponseHandler;

use Illuminate\Http\Response as HttpResponse;

class Response
{
    /**
     * Generates a successful JSON response.
     *
     * @param mixed $data
     * @param string $message
     * @return JSONResponse
     */
    public static function success($data, string $message = 'Success!')
    {
        return response()->json([
            'message' => $message,
            'data' => $data
        ], HttpResponse::HTTP_OK);
    }

    /**
     * Generates a failed JSON response.
     *
     * @param mixed $data
     * @param string $message
     * @return void
     */
    public static function failed($errors, string $message = 'Failed!')
    {
        return response()->json([
            'message' => $message,
            'errors' => $errors
        ], HttpResponse::HTTP_BAD_REQUEST);
    }
}