import React , {Component} from 'react';
import Axios from 'axios';
import {AppContext, Provider} from './Context';


class sp extends Component{
	static contextType = AppContext;  

    state = { 
        post_found:true,
        new_user:false,
        users:[]
    }

    addNewUser = (idSP, idP,tenS) => {
        if(this.state.post_found){
            this.setState({
                new_user:{idSP:idSP, idPL:idP, tenSP:tenS}
            });
        }
        else{
            this.setState({
                post_found:true
            });
        }
        
    }

    postShow = (show) => {
        this.setState({
            post_found:show
        })
    }

    insertUser = (event) => {
        event.preventDefault();
        event.persist();
        Axios.post('http://localhost/DOAN/SP/add_sp.php',{
            idPL:this.idpl.value,
            tenSP:this.ten.value
        })
        .then(function ({data}) {
            if(data.success === 1){
                
                this.context.addNewUser(data.idSP,this.idpl.value,this.ten.value);
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
        fetch('http://localhost/DOAN/SP/all_sp.php')
        .then(response => {
            response.json().then(function(data) {
                if(data.success === 1){
                    this.setState({
                        users:data.users.reverse()
                    });
                } 
                else{
                    this.context.post_show(false);
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

    handleUpdate = (idSP) => {
        Axios.post('http://localhost/DOAN/SP/update_sp.php',
        {
            idSP:idSP,
            idPL:this.idP.value,
            tenSP:this.tenS.value
        })
        .then(({data}) => {
            if(data.success === 1){
                let users = this.state.users.map(user => {
                    if(user.idSP === idSP){
                        user.idPL = this.idP.value;
                        user.tenSP = this.tenS.value;
                        user.isEditing = false;
                        return user;
                    }
                    return user; 
                });
                this.setState({
                    users
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

    
    editMode = (idSP) => {
        let users = this.state.users.map(user => {
            if(user.idSP === idSP){

                user.isEditing = true;
                return user;
            }
            user.isEditing = false;
            return user;
            
        });

        this.setState({
            users
        });
       
    }

    cancleEdit = (idSP) => {
        let users = this.state.users.map(user => {
            if(user.idSP === idSP){
                user.isEditing = false;
                return user;
            }
            return user
            
        });
        this.setState({
            users
        });
    }

    handleDelete = (idSP) => {
        let deleteUser = this.state.users.filter(user => {
            return user.idSP !== idSP;
        });
        
        Axios.post('http://localhost/DOAN/SP/delete_sp.php',{
            idSP:idSP
        })
        .then(({data}) => {
            if(data.success === 1){
                this.setState({
                    users:deleteUser
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

        const contextValue = {
            new_user:this.state.new_user,
            addNewUser:this.addNewUser,
            post_show:this.postShow
        }

		let mainData;

        let allUsers = this.state.users.map(({idSP,idPL,tenSP, isEditing}, index) => {
        	return isEditing === true ? (   
	            <tr style={{color: 'white'}}>
	            	<td>{idSP}</td>
	                <td><input className="form-control" type="text" ref={(item) => this.idP = item} defaultValue={idPL}/></td>
	                <td><input className="form-control" type="text" ref={(item) => this.tenS = item} defaultValue={tenSP}/></td>
	                <td>
	                    <button className="btn btn-success mr-2" onClick={() => this.handleUpdate(idSP)}>Save</button>
	                    <button onClick={() => this.cancleEdit(idSP)} className="btn btn-light">Cancel</button>
	                </td>
	            </tr>
            ) : ( 
                <tr style={{color: 'white'}}>
                	<td>{idSP}</td>
                    <td>{idPL}</td>
                    <td>{tenSP}</td>
                    <td>
                        <button className="btn btn-dark mr-2" onClick={() => this.editMode(idSP)}>Edit</button>
                        <button onClick={() => this.handleDelete(idSP)} className="btn btn-danger">Delete</button>
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
                                            <input type="text" name="idpl" ref={(val) => this.idpl = val} className="form-control"/>
                                        </div>
                                        <div className="form-group">
                                            <label className="font-weight-bold">Tên sản phẩm</label>
                                            <input type="text" name="ten" ref={(val) => this.ten = val} className="form-control"/>
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
								<th>Mã loại</th>
								<th>Tên sản phẩm</th>
								<th>Chức năng</th>
							</tr>
						</thead>
						<tbody>
							{allUsers}
						</tbody>
					</table>
				</div>
			);
        return(
        <Provider value={contextValue}>
            <>{mainData}</>
        </Provider>
        );
        
    }
}
export default sp;