import { Controller } from "@hotwired/stimulus"
import $ from "jquery"

// Connects to data-controller="recipe-ingredients"
export default class extends Controller { 
	connect() {
		console.log("RecipeIngredientsController connected");
	}
}