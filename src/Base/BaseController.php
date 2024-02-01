<?php

namespace Src\Base;

use Src\Http\Request;

class BaseController
{
    protected Request $request;
    function getRequest() {
        return $this->request;
    }

    function setRequest($request) {
        $this->request = $request;
    }
}