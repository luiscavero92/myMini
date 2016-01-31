<?php

class Error extends Controller
{
    private $msg;

    public function __construct($msg = "")
    {
        parent::__construct();
        $this->msg = $msg;
    }

    public function index()
    {
        echo $this->view->render('error/index', array(
            'msg' => $this->msg
        ));
    }
}
