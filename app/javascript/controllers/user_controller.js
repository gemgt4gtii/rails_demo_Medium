import { Controller } from "stimulus"
import axios from 'axios'
export default class extends Controller {
  static targets = [ "follow-button" ]

  follow(event){
    event.preventDefault()
    
        let user = this.followButtonTarget.dataset.user
        let button = this.followButtonTarget
      //   /users/:id/follow
        axios.post(`/users/${user}/follow`)
        .then(function(response){
            let status = response.data.status
            switch (status){
                case 'sign_in_first':
                    alert('請先登入')
                    break
                    default:
                        target.innerHTML = button
            }


            console.log(response.data)
        })
        .catch(function(error){
            console.log(error)
        })

     
  }
}