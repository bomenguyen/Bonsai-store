import React , {Component} from 'react';
import Axios from 'axios';
import {AppContext, Provider} from './Context';


class tt extends Component{
    static contextType = AppContext;  

    state = { 
        post_found:true,
        new_user:false,
        users:[]
    }

    addNewUser = (id, id1, id2, tenS, mO, gB, anH) => {
        if(this.state.post_found){
            this.setState({
                new_user:{ idC:id, tenCC:tenS, mota:mO, giaban:gB, anh:anH }
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
        Axios.post('http://localhost/DOAN/TT/add_tt.php',{
           
            tenCC:this.tenc.value,
            mota:this.mo.value,
            giaban:this.gia.value,
            anh:this.anhP.value
        })
        .then(function ({data}) {
            if(data.success === 1){
                
                this.context.addNewUser(this.tenc.value, this.mo.value, this.gia.value, this.anhP.value);
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
        fetch('http://localhost/DOAN/TT/all_tt.php')
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

    handleUpdate = (idC) => {
        Axios.post('http://localhost/DOAN/TT/update_tt.php',
        {
            idC:idC, 
            tenCC:this.tenS.value, 
            mota:this.mO.value, 
            giaban:this.gB.value, 
            anh:this.anH.value
        })
        .then(({data}) => {
            if(data.success === 1){
                let users = this.state.users.map(user => {
                    if(user.idC === idC){
                        user.tenCC = this.tenS.value; 
                        user.mota = this.mO.value; 
                        user.giaban = this.gB.value; 
                        user.anh = this.anH.value;
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

    
    editMode = (idC) => {
        let users = this.state.users.map(user => {
            if(user.idC === idC){

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

    cancleEdit = (idC) => {
        let users = this.state.users.map(user => {
            if(user.idC === idC){
                user.isEditing = false;
                return user;
            }
            return user
            
        });
        this.setState({
            users
        });
    }

    handleDelete = (idC) => {
        let deleteUser = this.state.users.filter(user => {
            return user.idC !== idC;
        });
        
        Axios.post('http://localhost/DOAN/TT/delete_tt.php',{
            idC:idC
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

        let allUsers = this.state.users.map(({ idC,idSP, idPL ,tenCC, mota, giaban, anh, isEditing}, index) => {
            return isEditing === true ? (   
                <tr >
                    <td><input className="form-control" type="text" ref={(item) => this.idc = item} defaultValue={idC}/></td>
                    <td><input className="form-control" type="text" ref={(item) => this.tenS = item} defaultValue={tenCC}/></td>
                    <td><input className="form-control" type="text" ref={(item) => this.mO = item} defaultValue={mota}/></td>
                    <td><input className="form-control" type="text" ref={(item) => this.gB = item} defaultValue={giaban}/></td>
                    <td><input className="form-control" type="text" ref={(item) => this.anH = item} defaultValue={anh}/></td>
                    <td>
                        <button className="btn btn-success mr-2" onClick={() => this.handleUpdate(idC)}>Save</button>
                        <button onClick={() => this.cancleEdit(idC)} className="btn btn-light">Cancel</button>
                    </td>
                </tr>
            ) : ( 
                <tr>
                    <td>{idC}</td>
                    <td>{tenCC}</td><td>{giaban}</td>
                    <td>{mota}</td>
                    
                    
                    <td>
                        <button className="btn btn-dark mr-2" onClick={() => this.editMode(idC)}>Edit</button>
                        <button onClick={() => this.handleDelete(idC)} className="btn btn-danger">Delete</button>
                    </td>
                </tr>
            );
        });

        
            mainData = (
                <div className="container"> <h1 class="mt-4">SẢN PHẨM</h1>
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
                                <th>Mã SP</th>
                               
                                <th>Tên sản phẩm</th>
                                <th>Giá bán</th>
                                <th>Mô tả</th>
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
export default tt;