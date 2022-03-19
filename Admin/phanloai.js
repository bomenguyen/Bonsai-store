import React , {Component} from 'react';
import Axios from 'axios';
import {AppContext, Provider} from './Context';


class pl extends Component{
    static contextType = AppContext;  

    state = { 
        post:true,
        new:false,
        type:[]
    }

    addNewUser = (tenPs ) => {
        if(this.state.post_found){
            this.setState({
                new:{tenPL:tenPs}
            });
        }
        else{
            this.setState({
                post:true
            });
        }
        
    }

    postShow = (show) => {
        this.setState({
            post:show
        })
    }

    insertUser = (event) => {
        event.preventDefault();
        event.persist();
        Axios.post('http://localhost/DOAN/PL/add_pl.php',{
            tenPL:this.tenP.value
        })
        .then(function ({data}) {
            if(data.success === 1){
                
                this.context.addNewUser(data.idPL ,this.tenP.value);
                event.target.reset();
                // alert(data.msg);
            }
            else{
                alert(data.msg);
            }
        }.bind(this))
        .catch(function (error) {
        console.log(error);
        });

    }

    //gọi đến API php
    fetchUsers = () => {
        fetch('http://localhost/DOAN/PL/all_pl.php')
        .then(response => {
            response.json().then(function(data) {
                if(data.success === 1){
                    this.setState({
                        type:data.type.reverse()
                    });
                } 
                else{
                    this.context.post(false);
                }               
            }.bind(this));
        })
        .catch(error => {
            console.log(error);
        });
    }
    //show ds
    componentDidMount(){
        this.fetchUsers();
    }

    handleUpdate = (idPL) => {
        Axios.post('http://localhost/DOAN/PL/update_pl.php',
        {
            idPL:idPL,
            tenPL:this.tenPs.value
        })
        .then(({data}) => {
            if(data.success === 1){
                let type = this.state.type.map(typ => {
                    if(typ.idPL === idPL){
                        typ.tenPL = this.tenPs.value;
                        typ.isEditing = false;
                        return typ;
                    }
                    return typ; 
                });
                this.setState({
                    type
                });
            }
            else{
                alert(data.msg);
            }
        })
        .catch(error => {
            console.log(error);
        });
    }

    
    editMode = (idPL) => {
        let type = this.state.type.map(typ => {
            if(typ.idPL === idPL){
                typ.isEditing = true;
                return typ;
            }
            typ.isEditing = false;
            return typ;
            
        });

        this.setState({
            type
        });
       
    }

    cancleEdit = (idPL) => {
        let type = this.state.type.map(typ => {
            if(typ.idPL === idPL){
                typ.isEditing = false;
                return typ;
            }
            return typ
            
        });
        this.setState({
            type
        });
    }

    handleDelete = (idPL) => {
        let deleteUser = this.state.type.filter(typ => {
            return typ.idPL !== idPL;
        });
        
        Axios.post('http://localhost/DOAN/PL/delete_pl.php',{
            idPL:idPL
        })
        .then(({data}) => {
            if(data.success === 1){
                this.setState({
                    type:deleteUser
                });
            }
            else{
                alert(data.msg);
            }
        })
        .catch(error => {
            console.log(error);
        });
    }
   
    render(){

        const context = {
            new:this.state.new,
            addNewUser:this.addNewUser,
            post:this.postShow
        }

        let mainData;

        let allPL = this.state.type.map(({idPL,tenPL, isEditing}, index) => {
            return isEditing === true ? (   
                <tr >
                    <td>{idPL}</td>
                    <td><input className="form-control" type="text" ref={(item) => this.tenPs = item} defaultValue={tenPL}/></td>
                    <td>
                        <button className="btn btn-success mr-2" onClick={() => this.handleUpdate(idPL)}>Save</button>
                        <button onClick={() => this.cancleEdit(idPL)} className="btn btn-light">Cancel</button>
                    </td>
                </tr>
            ) : ( 
                <tr>
                    <td>{idPL}</td>
                    <td>{tenPL}</td>
                    <td>
                        <button className="btn btn-dark mr-2" onClick={() => this.editMode(idPL)}>Edit</button>
                        <button onClick={() => this.handleDelete(idPL)} className="btn btn-danger">Delete</button>
                    </td>
                </tr>
            );
        });

        
            mainData = (
                <div className="container" style={{color: 'white'}}> <h1 class="mt-4">SẢN PHẨM</h1>
                    <div >
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">Thêm mới</button>
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Thêm mới sản phẩm</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                              </div>
                              <div class="modal-body">
                                    <form onSubmit={this.insertUser}>
                                    <div className="form-group">
                                        <div className="form-group">
                                            <label className="font-weight-bold">Tên sản phẩm</label>
                                            <input type="text" name="tenP" ref={(val) => this.tenP = val} className="form-control"/>
                                        </div>
                                        <div className="form-group col-sm-12 text-right">
                                            <button type="submit" className="btn btn-primary">Add user</button>
                                        </div>
                                    </div>
                                </form>  
                              </div>
                              
                            </div>
                          </div>
                        </div>  
                    </div>
                    <table className=" table " style={{color: 'white'}}>
                        <thead class="thead-dark">
                            <tr>
                                <th>STT</th>
                                <th>Tên sản phẩm</th>
                                <th>Chức năng</th>
                            </tr>
                        </thead>
                        <tbody>
                            {allPL}
                        </tbody>
                    </table>
                </div>
            );
        return(
        <Provider value={context}>
            <>{mainData}</>
        </Provider>
        );
        
    }
}
export default pl;