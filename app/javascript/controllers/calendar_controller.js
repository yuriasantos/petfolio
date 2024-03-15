import { Controller } from "@hotwired/stimulus"

const months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December"
];

let date = new Date();
let year = date.getFullYear();
let month = date.getMonth();

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = [ "day", "currDate" ]
  static values = { vetsAppointments: Array }

  connect() {
    this.fillCalendar();
    let now = new Date();
    let initialDay = now.getDate().toString().padStart(2, "0");
    let initialMonth = now.getMonth() + 1;
    let initialYear = now.getFullYear().toString();

    fetch(`${window.location.href.split('/').at(-1)}/appointments_list?query=${initialYear}-${initialMonth.toString().padStart(2, "0")}-${initialDay}`, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      document.querySelector(".consultations-container").innerHTML = data
    })
  }

  previousMonth() {
    month = month - 1
    this.checkDates()
    this.fillCalendar()
  }

  nextMonth() {
    month = month + 1
    this.checkDates()
    this.fillCalendar()
  }

  fillCalendar() {
    let dayone = new Date(year, month, 1).getDay();
    let lastdate = new Date(year, month + 1, 0).getDate();
    let dayend = new Date(year, month, lastdate).getDay();
    let monthlastdate = new Date(year, month, 0).getDate();
    let lit = "";
    for (let i = dayone; i > 0; i--) {
        lit +=
            `<li class="inactive">${monthlastdate - i + 1}</li>`;
    }
    for (let i = 1; i <= lastdate; i++) {
      let monthToCheck = (month+1).toString().padStart(2, "0")
      let dayToCheck = i.toString().padStart(2, "0")
      let toCheck = year + "-" + monthToCheck + "-" + dayToCheck;
      if (this.hasAppointment(toCheck)) {
        lit += `<li class="active" data-action="click->calendar#fetchAppointments">${i}</li>`;
      } else {
        lit += `<li class="" data-action="click->calendar#fetchAppointments">${i}</li>`;
      }
    }
    for (let i = dayend; i < 6; i++) {
        lit += `<li class="inactive">${i - dayend + 1}</li>`
    }
    this.currDateTarget.innerText = `${months[month]} ${year}`;
    this.dayTarget.innerHTML = lit;
  }

  checkDates() {
    if (month < 0 || month > 11) {
      date = new Date(year, month, new Date().getDate());
      year = date.getFullYear();
      month = date.getMonth();
    } else {
        date = new Date();
    }
  }

  hasAppointment(toCheck) {
    return this.vetsAppointmentsValue.includes(toCheck);
  }

  fetchAppointments(event){
    const vet_id = window.location.href.split('/').at(-1);
    const dateToQuery = this.monthYearFromCurrDate(event.target.textContent.padStart(2, "0"))
    fetch(`${vet_id}/appointments_list?query=${dateToQuery}`, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      document.querySelector(".consultations-container").innerHTML = data
    })
  }

  monthYearFromCurrDate(currDay){
    let currMonth = (months.indexOf(this.currDateTarget.textContent.split(' ')[0]) + 1).toString().padStart(2, "0")
    let currYear = this.currDateTarget.textContent.split(' ')[1]
    return `${currYear}-${currMonth}-${currDay}`
  }
}
