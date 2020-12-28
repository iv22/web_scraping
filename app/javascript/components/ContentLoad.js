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
      <form ref={form} onSubmit={formSubmit}>
        <div>
          <input type="radio" id="onliner" name="source" value="onliner" 
            checked={selectedSource === "onliner"}
            onChange={onValueChange}/>
          <label htmlFor="onliner">Новости Onliner</label>          
          {selectedSource === "onliner" ? <PeopleOnliner />: null}          
        </div>
        <div>
          <input type="radio" id="rabotaby" name="source" value="rabotaby" 
            checked={selectedSource === "rabotaby"} 
            onChange={onValueChange} />
          <label htmlFor="rabotaby">Вакансии RabotaBy</label>
          {selectedSource === "rabotaby" ? <RabotaBy />: null}           
        </div>
        <input type='submit' value='Собрать данные' />
      </form>        
    </div>
  );
}

export default ContentLoad