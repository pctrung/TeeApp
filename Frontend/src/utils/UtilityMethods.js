import moment from "moment";

export function formatDate(d) {
  let date = new Date(d);
  if (isValidDate(date)) {
    let now = moment(new Date());
    let dateToFormat = moment(date);
    let diff = now.diff(dateToFormat, "days");
    if (diff < 1) {
      return dateToFormat.fromNow();
    } else if (diff < 7) {
      return dateToFormat.format("dddd, h:mm A");
    } else {
      return dateToFormat.format("MMM D, YYYY, h:mm A");
    }
  } else {
    return "--";
  }
}

function isValidDate(d) {
  return d instanceof Date && !isNaN(d);
}

export const groupBy = function (xs, key) {
  return xs.reduce(function (rv, x) {
    (rv[x[key]] = rv[x[key]] || []).push(x);
    return rv;
  }, {});
};

export function checkRegex(value, regex) {
  if (value && regex) {
    var pattern = new RegExp(regex);
    var res = pattern.test(value);
    return res;
  }
}
export function identityObjectToString(obj) {
  let str = "";
  for (const val of Object.values(obj)) {
    str += `${val.toString()}, `;
  }
  str = str.substring(0, str.length - 2);
  return str;
}

export function isVideo(fileUrl) {
  return fileUrl?.imageUrl?.toString()?.match(/\.(mp4|webm|ogg|mov|avi|wmv|flv|mpeg|mpg|mkv)$/i);
}