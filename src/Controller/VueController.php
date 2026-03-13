<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/app')]
final class VueController extends AbstractController
{
    #[Route('', name: 'app_vue')]
    public function app(): Response {
        return $this->render('app/app.html.twig', [
            'controller_name' => 'VueController',
        ]);
    }
}
