// create and download a csv file in react app
// where headers is an array and data is a string with values, eg for a single row.
let head = ['id', 'name', 'county']
let filler = '"2","bob","king"'

const downloadSampleFile = (data, headers) => {  
    let csvRows = [];
    let headers = headers.map(str => `"${str}"`);
    csvRows.push(headers)
    csvRows.push('\n') 
    csvRows.push(data)
    const blob = new Blob(csvRows, { type: 'text/csv' });
    const url = window.URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.setAttribute('href', url)
    a.setAttribute('download', 'sample.csv');
    a.click()
  }

downloadSampleFile(filler, head)
