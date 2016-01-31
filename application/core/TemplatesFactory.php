<?php

class TemplatesFactory
{
    private static $templates;

    public static function templates()
    {
        if(!TemplatesFactory::$templates){
            TemplatesFactory::$templates = new League\Plates\Engine(APP . 'view');
            TemplatesFactory::$templates->addData(['titulo' => 'FAQ']);
            TemplatesFactory::$templates->registerFunction('borrar_msg_feedback', function(){
                Session::set('feedback_negative', null);
                Session::set('feedback_positive', null);
            });
        }
        return TemplatesFactory::$templates;
    }
}