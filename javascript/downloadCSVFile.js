// create and download a csv file
// where headers is an array and data is a string with values, eg for a single row.

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
