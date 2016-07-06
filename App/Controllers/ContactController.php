<?php
namespace App\Controllers;

use App\Models\Contact;
use App\Support\Mail;
use Cac\Controller\Action;

class ContactController extends Action
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
            $this->send($contact);
            $contact->update(['status' => true]);
            echo json_encode(['msg' => 'Email enviado com sucesso']);
        }catch (\Exception $e)
        {
            echo json_encode(['Error' => $e->getMessage()]);
        }
    }

    public function send($contact)
    {
        $answer  = $this->render('site.email.answer', ['contact' => $contact]);
        $mail = new Mail($this->from, $answer, 'Novo Contato');
        if($mail){
            $message = $this->render('site.email.email');
            new Mail([$contact->email => $contact->name], $message, 'Hotspot');
        }else{
            throw new \Exception('Falha ao enviar o E-mail');
        }
    }

    public function show()
    {
        try{
            $contact = $this->contact->find($_GET['id']);
            echo $this->render('admin.contacts.show', ['contact' => $contact]);
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