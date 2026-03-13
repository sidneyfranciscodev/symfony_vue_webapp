import axios from "axios";

export const baseURL = "http://localhost:8000"; // add your backend URL here

const setConfig = config => {
    // add token to the header if it exists

    //const token = getToken() ?? null;
    //if (token) config.headers.Authorization = `Bearer ${token}`;

    return config;
}

export const api = axios.create({
    baseURL: baseURL,
    headers: { "Content-Type": "application/json" }
});

api.interceptors.request.use(async config => {
    return setConfig(config)
}, error => Promise.reject(error));
