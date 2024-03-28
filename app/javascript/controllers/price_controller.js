import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price"
export default class extends Controller {
  static targets = ["numberofday","pricepernight","totalprice","checkin", "checkout", "pnight", "ptotal"]

  connect() {
    console.log("hello from the price controller")
  }

  calculate(event) {

    const date1 = new Date(Date.parse(this.checkinTarget.value))
    const date2 = new Date(Date.parse(this.checkoutTarget.value))

    // Calculer la différence en millisecondes
    const diffInMilliseconds = Math.abs(date2.getTime() - date1.getTime());

    // Convertir la différence en jours
    const diffInDays = Math.ceil(diffInMilliseconds / (1000 * 60 * 60 * 24));

    // Afficher le résultat dans la console
    if (diffInDays >= 1) {
      console.log(this.pricepernightTarget.innerHTML)
      this.numberofdayTarget.innerHTML = diffInDays
      const pricepernight = parseFloat(this.pricepernightTarget.innerHTML)
      const totalprice = diffInDays * pricepernight
      this.totalpriceTarget.innerHTML = totalprice

      this.pnightTarget.value = pricepernight
      this.ptotalTarget.value = totalprice
    }
    else {
      console.log("error on number of days")
    }
  }

  reserve(event) {

  }
}
