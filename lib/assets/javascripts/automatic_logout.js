/**
 * Module AutomaticLogout for JS Files
 * @type {[type]}
 */
window.AutomaticLogout = {};

AutomaticLogout.load = function () {
  var $regressiveTimer = document.querySelectorAll(".regressive-timer")[0];

  if (!!$regressiveTimer && $regressiveTimer.dataset.seconds != "") {
    console.log("[AutomaticLogout] regressiveTimer started");
    AutomaticLogout.regressiveTimer();
  }
};

/**
 * Send request for destroy session current_user
 * @return {[type]} [description]
 */
AutomaticLogout.destroySession = function (message) {
  var xhr = new XMLHttpRequest();
  xhr.open("GET", "/automatic_logout/destroy", true);

  xhr.onload = function () {
    if (xhr.status == 200) {
      var $wrapper = document.querySelectorAll(".regressive-timer")[0];

      if ($wrapper && eval($wrapper.dataset.alert) && message) {
        window.alert(message);
      }

      return (window.location.href = "/");
    }
  };
  xhr.send();
};

/**
 * Method regressive time based in session auto expired at.
 * @param  {[type]} date_session [description]
 * @return {[type]}              [description]
 */
AutomaticLogout.regressiveTimer = function () {
  /**
   * Define o que vai ser impresso no DOM.
   * @param {DOM Object} container
   * @param {Boolean} visible
   * @param {String} textContent
   */
  var visibleTimer = function (container, visible, textContent) {
    if (!visible) visible = "false";
    if (!textContent) textContent = "00:00:00";

    if (visible == "true") {
      return (container.textContent = textContent);
    }
  };

  /**
   * Variables used
   * @param  {[type]} '.regressive-timer' [description]
   * @return {[type]}                     [description]
   */
  var $regressiveTimer = document.querySelector(".regressive-timer"),
    data_message = String($regressiveTimer.dataset.message),
    data_seconds = Number($regressiveTimer.dataset.seconds),
    current_time = new Date().getTime();

  visibleTimer($regressiveTimer, $regressiveTimer.dataset.visible);

  var time_expired = new Date();
  time_expired.setSeconds(time_expired.getSeconds() + data_seconds);

  if (data_seconds != 0 && data_seconds != "") {
    var timerDecrement = setInterval(function () {
      if (data_seconds == 0) {
        clearInterval(timerDecrement);
        // limpa a sessão após o ok
        AutomaticLogout.destroySession(data_message);
      } else {
        //tempo descrecente
        time_expired.setSeconds(time_expired.getSeconds() - 1);

        var seconds_integer = (time_expired.getTime() - current_time) / 1000,
          date_format = AutomaticLogout.parseDate(seconds_integer),
          output_date_format =
            date_format.hours +
            ":" +
            date_format.minutes +
            ":" +
            date_format.seconds;

        visibleTimer(
          $regressiveTimer,
          $regressiveTimer.dataset.visible,
          output_date_format
        );
      }

      data_seconds -= 1;
    }, 1000);
  }
};

/**
 * Parse Date
 * @param  float seconds seconds_float [description]
 * @return {
 *   days: days,
 *   hours: hours,
 *   minutes: minutes,
 *   seconds: seconds
 * }
 */
AutomaticLogout.parseDate = function (seconds_float) {
  var days, hours, minutes, seconds;

  days = parseInt(seconds_float / 86400);
  seconds_float = seconds_float % 86400;

  hours = parseInt(seconds_float / 3600);
  seconds_float = seconds_float % 3600;

  minutes = parseInt(seconds_float / 60);
  seconds = parseInt(seconds_float % 60);

  if (hours < 10) {
    hours = "0" + hours;
    hours = hours.substr(0, 2);
  }

  if (minutes < 10) {
    minutes = "0" + minutes;
    minutes = minutes.substr(0, 2);
  }

  if (seconds <= 9) {
    seconds = "0" + seconds;
  }

  return {
    days: days,
    hours: hours,
    minutes: minutes,
    seconds: seconds,
  };
};
