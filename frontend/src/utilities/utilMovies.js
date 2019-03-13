import axios from "axios";

export const fetchAllMovieswithRatings = () => {
  axios.get("/movies");
};
