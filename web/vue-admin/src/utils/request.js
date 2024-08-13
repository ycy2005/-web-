import axios from 'axios'

// create an axios instance
const service = axios.create({
  baseURL: 'http://localhost:3000', // url = base url + request url
  // withCredentials: true, // send cookies when cross-domain requests
  timeout: 5000, // request timeout
  headers: {
    'Content-Type': 'application/json'
  }
})

// 响应拦截器
service.interceptors.response.use(
  response => {
    return response.data
  }
)

export default service
