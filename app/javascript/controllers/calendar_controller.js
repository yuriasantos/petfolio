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

let now = new Date();
let date = new Date();
let currDay = now.getDay();
let year = date.getFullYear();
let month = date.getMonth();

// Connects to data-controller="calendar"
export default class extends Controller {
  static targets = [ "day", "currDate", "dayWithAppointment", "insertAppointments" ]
  static values = { vetsAppointments: Array }

  connect() {
    this.fillCalendar()
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
        lit += `<li class="active" data-calendar-target="dayWithAppointment" data-action="click->calendar#fetchAppointments">${i}</li>`;
      } else {
        lit += `<li class="">${i}</li>`;
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
    console.log(event.textContent)
    fetch(`${vet_id}/appointments_list?query=${event.currentTarget.textContent}`, {headers: {"Accept": "text/plain"}})
    .then(response => response.text())
    .then((data) => {
      document.querySelector(".consultations-container").innerHTML = data
      // this.insertAppointmentsTarget.innerHTML = data
    })
  }

  monthYearFromCurrDate(){
    let currMonth = (months.indexOf(currDate.split(' ')[0]) + 1).toString()
    let currYear = currDate.split(' ')[1]
    return `${currYear}-${currMonth}`

  }
}
