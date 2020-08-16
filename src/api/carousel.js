import axios from 'axios'

export default {
    getCarousel() {
        return axios.get("/carousel")
    },
    getProductList() {
        return axios.get(`/product`)
    }
}