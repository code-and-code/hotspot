<?php
namespace App\Controllers;

use App\Models\Contact;
use App\Support\Mail;

class ContactController extends Controller
{
    private $contact;
    private $from;

    public function __construct()
    {
        $this->contact = new Contact();
        $this->from    = ['contato@hotspotcwk.com.br' => 'Hotspot'];
    }

    public function index()
    {
        $contacts = $this->contact->all();
        echo $this->render('admin.contacts.index', ['contacts' => $contacts]);
    }

    public function store()
    {
        try{

            $contact = $this->contact->create($_REQUEST);

            if($this->send($contact))
            {
                echo json_encode(['msg' => 'Email enviado com sucesso'],200);
            }
        }catch (\Exception $e)
        {
            throw new \Exception($e);
        }
    }

    public function send($contact)
    {
        $message = $this->render('site.email.email');
        $answer  = $this->render('site.email.answer', ['contact' => $contact]);
        try {
            $mail = new Mail($this->from, $answer, 'Novo Contato');

            if($mail){
                new Mail([$contact->email => $contact->name], $message, 'Hotspot');
            }
        }
        catch (\Exception $e)
        {
            echo $e;
        }
    }

    public function show()
    {
        try{
            $contact = $this->contact->find($_GET['id']);
            echo $this->render('admin.contacts.message', ['contact' => $contact]);
        }catch (\Exception $e)
        {
            throw new \Exception($e);
        }
    }

    public function delete()
    {
        $this->contact->find($_GET['id'])->delete();
        header("Location: /admin/contact");
    }
}