import React, {useState} from "react"
import PeopleOnliner from "./PeopleOnliner"
import RabotaBy from "./Rabotaby"

function ContentLoad(props) {
  
  const [selectedSource, setSelected] = useState(props.selected)

  const formSubmit = (event) => {
    event.preventDefault();
    console.log("SUBMIT")
  }

  const onValueChange = (event) => {
    console.log("ON_CHANGE: " + event.target.value)
    setSelected(event.target.value)
  }

  return (
    <div>
      <form onSubmit={formSubmit}>
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