import "@/twig/styles/main.scss";

import { Application } from "@hotwired/stimulus";

import MenuController from "@/twig/controllers/menu_controller";

const application = Application.start();

application.register("menu", MenuController);
