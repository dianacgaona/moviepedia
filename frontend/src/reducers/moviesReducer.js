import { RECEIVE_MOVIES } from "../actions/actionMovies";

export const moviesReducer = (oldState = {}, action) => {
  Object.freeze(oldState);
  switch (action.type) {
    case RECEIVE_MOVIES:
      return normalize(action.movies);
    default:
      return oldState;
  }
};

const normalize = arr => {
  let obj = {};
  arr.forEach(el => {
    obj[el.id] = el;
  });
  return obj;
};
