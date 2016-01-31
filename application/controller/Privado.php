<?php

class Privado extends Controller
{
    public function __construct()
    {
        parent::__construct();
        Auth::checkAutentication();
    }

    public function index()
    {
        echo $this->view->render("privado/index");
    }
}