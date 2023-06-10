// https://stevepolito.design/blog/rails-auto-save-form-data
import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  static targets = ['form']

  connect() {
    // Create a unique key to store the form data into localStorage.
    // This could be anything as long as it's unique.
    // https://developer.mozilla.org/en-US/docs/Web/API/Window/localStorage
    this.localStorageKey = window.location

    // Retrieve data from localStorage when the Controller loads.
    this.setFormData()
  }

  clearLocalStorage() {
    // See if there is data stored for this particular form.
    if (localStorage.getItem(this.localStorageKey) != null) {
      // Clear data from localStorage when the form is submitted.
      localStorage.removeItem(this.localStorageKey)
    }
  }

  getFormData() {
    // Construct a set of of key/value pairs representing form fields and their values.
    // https://developer.mozilla.org/en-US/docs/Web/API/FormData
    const form = new FormData(this.formTarget)
    const data = []

    // Loop through each key/value pair.
    // https://developer.mozilla.org/en-US/docs/Web/API/FormData/entries#example
    for (const pair of form.entries()) {
      // We don't want to save the authenticity_token to localStorage since that is generated by Rails.
      // https://guides.rubyonrails.org/security.html#cross-site-request-forgery-csrf
      if (pair[0] != 'authenticity_token' && !pair[0].includes('password')) {
        data.push([pair[0], pair[1]])
      }
    }

    // Return the key/value pairs as an Object. Each key is a field name, and each value is the field value.
    // https://developer.mozilla.org/en-us/docs/Web/JavaScript/Reference/Global_Objects/Object/fromEntries
    return Object.fromEntries(data)
  }

  saveToLocalStorage() {
    const data = this.getFormData()
    // Save the form data into localStorage. We need to convert the data Object into a String.
    localStorage.setItem(this.localStorageKey, JSON.stringify(data))
  }

  setFormData() {
    // See if there is data stored for this particular form.
    if (localStorage.getItem(this.localStorageKey) != null) {
      // We need to convert the String of data back into an Object.
      const data = JSON.parse(localStorage.getItem(this.localStorageKey))
      // This allows us to have access to this.formTarget in the loop below.
      const form = this.formTarget
      // Loop through each key/value pair and set the value on the corresponding form field.
      Object.entries(data).forEach((entry) => {
        const name = entry[0]
        const value = entry[1]
        const input = form.querySelector(`[name='${name}']`)
        input && (input.value = value)
      })
    }
  }
}
