import React, {useState, useRef} from "react"
import PeopleOnliner from "./PeopleOnliner"
import RabotaBy from "./Rabotaby"

function ContentLoad(props) {
  const token = document.querySelector('meta[name="csrf-token"]').content   
  const [selectedSource, setSelected] = useState(props.selected)
  const form = useRef(null)

  const formSubmit = (event) => {
    event.preventDefault()
    console.log("SUBMIT")
    const data = new FormData(form.current)
    fetch(`/admin/load/${selectedSource}`,
    {
      method: 'POST',
      headers: {
        'X-CSRF-Token': token
      },
      body: data
    })
    .then((response) => {
      return response
    })
    .then((data) => {
      console.log(data)
    });    
  }

  const onValueChange = (event) => {
    console.log("ON_CHANGE: " + event.target.value)
    setSelected(event.target.value)
  }

  return (
    <div>      
      <form ref={form} onSubmit={formSubmit} class="container">
        <div class="row">
          <div class="container">
            <div class="row">
              <label htmlFor="onliner" class="btn btn-secondary">
                <input type="radio" id="onliner" name="source" value="onliner" 
                  checked={selectedSource === "onliner"}
                  onChange={onValueChange}/>
                Новости Onliner
              </label>          
            </div>
            <div class="row">
              {selectedSource === "onliner" ? <PeopleOnliner />: null}          
            </div> 
          </div>
        </div>
        <div class="row">
          <div class="container">
            <div class="row">
              <label htmlFor="rabotaby" class="btn btn-secondary">
                <input type="radio" id="rabotaby" name="source" value="rabotaby" 
                  checked={selectedSource === "rabotaby"} 
                  onChange={onValueChange} />
                Вакансии RabotaBy
              </label>
            </div>
            <div class="row">
              {selectedSource === "rabotaby" ? <RabotaBy />: null}           
            </div>  
          </div>
        </div>
        <div class="row">      
          <input type='submit' value='Собрать данные' class="btn btn-primary" data-toggle="button" />
        </div>
      </form>        
    </div>
  );
}

export default ContentLoad