import React, {useState} from "react"
import DatePicker from "react-datepicker"
import "react-datepicker/dist/react-datepicker.css"

function PeopleOnliner(props) {
  
  const [startDate, setStartDate] = useState(new Date())
  const [endDate, setEndDate] = useState(new Date())

  return (
    <div>
      <label> 
        Начало периода<br/>
        <DatePicker selected={startDate} onChange={date => setStartDate(date)} />
      </label>
      <br/>
      <label> 
        Конец периода (включительно)<br/>
        <DatePicker selected={endDate} onChange={date => setEndDate(date)} />
      </label>      
    </div>
  );
}

export default PeopleOnliner