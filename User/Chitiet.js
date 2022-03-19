import React, { Component} from 'react';
import Axios from 'axios';
import {CartContext} from './Cart';

class chi extends Component {

    constructor(props) {
	  super(props);
	  this.state = {a:[] };
	}

	componentDidMount() {
        Axios.get("http://localhost/QL/services1.php").then(res => {
          this.setState({
            a: res.data.a
          });
        });  
	}

    render(){
    	return(
           <div className="container" style={{ color: 'white'}}>
            <h1 > CHI TIẾT SẢN PHẨM</h1>
            <div >
              {this.state.a.map(product => (
                <div >
                  <table width="100%" style={{ padding: '250px'}}>
                      <tr>
                          <th rowspan="6"><img  src={product.anh} width="250px" style={{ margin: '10px'}}/></th>
                      </tr>
                      <tr>

                          <td>Mã sản phẩm: {product.idC}</td>
                          
                      </tr>
                      <tr>
                          
                          <td>Tên sản phẩm: {product.tenCC} </td>
                          
                      </tr>
                      <tr>
                          
                          <td>Gía bán: {product.giaban}</td>
                      </tr>
                      <tr>
                          
                          <td> Mô tả: {product.mota}</td>
                      </tr>
                      <tr>
                          
                          <td><CartContext.Consumer>
                        {({ addToCart }) => (
                          <button class="button" onClick={() => addToCart(product)}>
                            Add to cart
                          </button>
                        )}
                      </CartContext.Consumer></td>
                      </tr>
                  </table>
                </div>
              ))}
            </div>
          </div>
    	);
    }
}
export default chi;