BUS2.Nav = React.createClass({
  getInitialState: function() {
    return {
      position: 'bus2-nav-content about'
    }
  },

  navCloseHandler: function() {
    $(window).trigger('bus2::closeMenu');
    BUS2.mainContainer.find('.bus2-nav').removeClass('on');
  },

  navLinksHandler: function(event) {
    var $el = $(event.target);

    if (!$el.hasClass('select')) {
      if ($el.hasClass('about')) {
        this.setState({ position: 'bus2-nav-content about' })
      } else if ($el.hasClass('how-it-works')) {
        this.setState({ position: 'bus2-nav-content how-it-works' })
      }

      BUS2.mainContainer.find('.bus2-nav-links .about').toggleClass('select');
      BUS2.mainContainer.find('.bus2-nav-links .how-it-works').toggleClass('select');
    }
  },

  navLinkAlertHandler: function() {

  },

  render: function() {
    return (
      <div>
        <ul className="bus2-nav-links">
          <li><a className="about select" onClick={this.navLinksHandler}>A empresa</a></li>
          <li><a className="how-it-works" onClick={this.navLinksHandler}>Como funciona</a></li>
          <li><a onClick={this.navLinkAlertHandler} className="bus2-alert-btn">Bus alerta</a></li>
        </ul>

        <div className={this.state.position}>
          <div className="bus2-nav-content-about">
            we are awesome :)
          </div>
          <div className="bus2-nav-content-how-it-works">
            <ul className="bus2-steps">
              <li>
                <div className="circle-step"></div>
                <span>Indique sua localização</span>
              </li>
              <li>
                <div className="circle-step"></div>
                <span>Localize um ou mais ônibus</span>
              </li>
              <li>
                <div className="circle-step"></div>
                <span>Colabore quando pegar seu ônibus</span>
              </li>
            </ul>
            <strong className="headline">
              Não fique mais parado esperando seu ônibus. Faça uma busca e descubra em tempo real a localização do seu ônibus.
            </strong>        
            <button className="search-btn">
              Fazer uma busca
              <svg className="search">
                <use xlinkHref="#search"></use>
              </svg>
            </button>
          </div>
        </div>

        <a className="bus2-nav-close" onClick={this.navCloseHandler}>X</a>
      </div>
    )
  }
});