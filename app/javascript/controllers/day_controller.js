import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="day"
export default class extends Controller {
  connect() { 
  }

  toggle() {
    console.log('lets go')
    if (this.element.checked) {
      // this.element.closest('.todo').classList.add('todo-done');
    } else {
      // this.element.closest('.todo').classList.remove('todo-done');
    }
    
    let day_id = this.element.dataset.id;
    
    let url = `/days/${day_id}`
	
    let data = JSON.stringify({
      day: {
        done: this.element.checked
      }
    });
    
    fetch(url, {
      method: "PATCH",
      credentials: "same-origin",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": getMetaValue("csrf-token"),
      },
      body: data
    })
  }
}



function getMetaValue(name) {
  const element = document.head.querySelector(`meta[name="${name}"]`)
  return element.getAttribute("content")
}