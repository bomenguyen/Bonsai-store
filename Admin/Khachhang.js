import React , {Component} from 'react';
import Axios from 'axios';
import {AppContext, Provider} from './Context';


class kh extends Component{
    static contextType = AppContext;  

    state = { 
        
        type:[]
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

    render(){

        const context = {
            new:this.state.new,
            addNewUser:this.addNewUser,
            post:this.postShow
        }

        let mainData;

        let allPL = this.state.type.map(({so, ma, nagydat, trigia, ngaygiao, isEditing}, index) => {
            return isEditing === true ? (   
                <tr >
                    <td>{so}</td>
                    <td><input className="form-control" type="text"  defaultValue={ma}/></td>
                    <td><input className="form-control" type="text"  defaultValue={nagydat}/></td>
                    <td><input className="form-control" type="text"  defaultValue={trigia}/></td>
                    <td><input className="form-control" type="text"  defaultValue={ngaygiao}/></td>
                    <td>
                        <button className="btn btn-success mr-2" >Save</button>
                        <button  className="btn btn-light">Cancel</button>
                    </td>
                </tr>
            ) : ( 
                <tr>
                    <td>{so}</td>
                    <td>{ma}</td>
                    <td>{nagydat}</td>
                    <td>{ngaygiao}</td>
                    <td>{trigia}</td>
                    <td>
                        <button className="btn btn-dark mr-2" >Edit</button>
                        <button  className="btn btn-danger">Delete</button>
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
                                <th>Số đơn </th>
                                <th>Mã khách hàng</th>
                                <th>Ngày đặt </th>
                                <th>Trị giá </th>
                                <th>Ngày giao</th>
                                <th>chức năng </th>
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
export default kh;