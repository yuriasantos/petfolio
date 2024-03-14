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
  static targets = [ "day", "currdate" ]

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
        let isToday = i === date.getDate()
            && month === new Date().getMonth()
            && year === new Date().getFullYear()
            ? "active"
            : "";
        lit += `<li class="${isToday}">${i}</li>`;
    }
    for (let i = dayend; i < 6; i++) {
        lit += `<li class="inactive">${i - dayend + 1}</li>`
    }
    this.currdateTarget.innerText = `${months[month]} ${year}`;
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
}
