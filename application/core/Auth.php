<?php

class Auth
{
    public static function checkAutentication()
    {
        Session::init();
        if(!Session::userIsLoggedIn()){
            Session::destroy();
            header('location: /login');
            exit();
        }
    }
}