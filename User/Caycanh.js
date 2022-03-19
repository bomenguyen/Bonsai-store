import React, { Component} from 'react';
import Axios from 'axios';
import {CartContext} from './Cart';

class ca extends Component {

    constructor(props) {
	  super(props);
	  this.state = {services:[] };
	}

	componentDidMount() {
        Axios.get("http://localhost/QL/services.php").then(res => {
          this.setState({
            services: res.data.services
          });
        });  
	}

    render(){
    	return(
           <div>
            <div style={{ color: 'white', margin:"20px"}}><h1 align="center">CÂY CẢNH</h1></div>
            <div className="row">
              {this.state.services.map(product => (
                <div class = "col-md-3">
                  <div class= "card" style={{width: '18rem',margin:"5px" }}>
                    <img class = "card-img-top" src={product.anh} />
                    <div class = "card-body">
                      <h5 class= "card-title" >{product.tenCC}</h5>
                      <p class= "card-text" >{product.giaban}</p>
                      <CartContext.Consumer>
                        {({ addToCart }) => (
                          <button class="button" onClick={() => addToCart(product)}>
                            Add to cart
                          </button>
                        )}
                      </CartContext.Consumer>
                    </div>
                  </div>
                </div>
              ))}
            </div>
          </div>
    	);
    }
}
export default ca;