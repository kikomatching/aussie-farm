import PetList from './modules/PetList'

PetList.initializeDxDataGrid([
    {
        dataField: "id",
        visible: false,
    }, 
    {
        dataField: "name"
    }, 
    {
        dataField: "birthday",
    },
    {
        caption: "Weight (kg)",
        dataField: "weight", 
    },
    {
        caption: "Height (cm)",
        dataField: "height", 
    },
    {
        dataField: "friendly", 
    }
])
