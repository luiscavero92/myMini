<?php

class Login extends Controller{

    public function index()
    {

        echo $this->view->render('login/index');

    }

    public function dologin()
    {

        if(LoginModel::dologin($_POST)){

            echo $this->view->render('login/usuariologueado');

        } else {

            echo $this->view->render('login/index');

        }

    }

    public function salir()
    {

        Session::destroy();
        header('location: /');
        exit();

    }


}