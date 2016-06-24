<?php

namespace App\Controllers;

use App\Models\Contact;

class ContactController extends  Controller
{
    public function index()
    {
        $contact = new Contact();
        echo $this->render('assets.contacts', ['contacts' => $contact->all()]);
    }

    public function delete()
    {
        $id = $_GET['id'];
        $contact = new Contact();
        $contact->find($id)->delete();
        $this->render($this->index());
    }
}