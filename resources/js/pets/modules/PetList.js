export default class PetList
{
    constructor() {
        
    }

    static initializeDxDataGrid(columns) {                
        fetch('api/v1/pets')
            .then(response => response.json())
            .then(data => {
                $("#dataGrid").dxDataGrid({
                    allowColumnReordering: true,
                    columns: columns,
                    dataSource: data.data,
                    selection: { mode: "single" },
                    onSelectionChanged: function(e) {
                        e.component.byKey(e.currentSelectedRowKeys[0]).done(pet => {
                            if (pet) {
                                window.location = 'pets/' + pet.id
                            }
                        });
                    },
                })
            })
    }
}