import React, { Component } from 'react';
import Axios from 'axios';
import {CartContext} from './Cart';


class Trangchu extends Component {

    constructor(props) {
      super(props);
      this.state = {
        services:[]
      };
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
            <div className ="container">
              
                <div id="carouselExampleIndicators" className="carousel slide my-4" data-ride="carousel">
                      <ol className="carousel-indicators">
                          <li data-target="#carouselExampleIndicators" data-slide-to={0} className="active" />
                          <li data-target="#carouselExampleIndicators" data-slide-to={1} />
                          <li data-target="#carouselExampleIndicators" data-slide-to={2} />
                      </ol>
                      <div className="carousel-inner" role="listbox">
                          <div className="carousel-item active">
                              <img className="d-block img-fluid" style={{height:'500px', width:'100%'}} src="hinh/A1.jpg" alt="First slide" />
                          </div>
                          <div className="carousel-item">
                              <img className="d-block img-fluid" style={{ height: '500px',width:'100%' }} src="hinh/A2.jpg" alt="Second slide" />
                          </div>
                          <div className="carousel-item">
                              <img className="d-block img-fluid" style={{ height: '500px',width:'100%' }} src="hinh/A3.jpg" alt="Third slide" />
                          </div>
                      </div>
                      <a className="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                          <span className="carousel-control-prev-icon" aria-hidden="true" />
                          <span className="sr-only">Previous</span>
                      </a>
                      <a className="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                          <span className="carousel-control-next-icon" aria-hidden="true" />
                          <span className="sr-only">Next</span>
                      </a>
                </div>
                <h1 align = "center" style={{color: 'white'}}> SẢN PHẨM BÁN CHẠY </h1>
              <div class="row">
                    {this.state.services.map(product => (
                      <div class = "col-md-4">
                        <div class= "card" style={{width: '20rem' , margin: '5px'}}>
                          <img class = "card-img-top" src={product.anh} />
                            <div class = "card-body">
                              <h5 class= "card-title" >{product.tenCC}</h5>
                              <p class= "card-text" >{product.giaban}</p>
                              <button class="button">Add to card</button>
                            </div>
                        </div>
                      </div>
                    ))}
              </div>
        </div>
        );
    }
}
export default Trangchu;