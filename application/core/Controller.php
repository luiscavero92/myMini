<?php

class Controller
{
    public $view = null;

    function __construct()
    {
        $this->view = TemplatesFactory::templates();
        Session::init();
    }
}
