BUS2.SearchView = React.createClass({

  searchHandler: function(event) {
    event.preventDefault();

    var inputCountry = ReactDOM.findDOMNode($('#country')[0]),
        inputState = ReactDOM.findDOMNode($('#state')[0]),
        inputCity = ReactDOM.findDOMNode($('#city')[0]);



  },

  shareGPS: function() {
    if (navigator.geolocation) {

      navigator.geolocation.getCurrentPosition(function(position){
        console.log(position);
      });

    }
  },

  render: function () {
    return (
      <div className="bus2-search-wrapper">
        <div className="bus2-searching">
          <span>BUSCANDO...</span>
        </div>

        <div className="bus2-search-not-found">
          <div className="bus2-search-not-found-wrapper">
            <span className="search-result">NENHUM ÔNIBUS ENCONTRADO</span>
            <button className="search-btn">
              Fazer uma busca
              <svg className="search">
                <use xlinkHref="#search"></use>
              </svg>
            </button>
          </div>
        </div>

        <div className="bus2-search-content">
          <h2>Encontre seu ônibus em tempo real</h2>
          <form action="" onSubmit={this.searchHandler}>
            <BUS2.SearchInput className="search-input" id="country" placeholder="Selecione um país" name="country" />
            <BUS2.SearchInput className="search-input" id="state" placeholder="Selecione um estado" name="state" />
            <BUS2.SearchInput className="search-input" id="city" placeholder="Selecione uma cidade" name="city" />

            <a className="share-gps" onClick={this.shareGPS}>Compartilhe sua localização</a>

            <BUS2.SearchInput className="search-input" id="line" placeholder="SELECIONE UMA LINHA" name="line" />

            <div className="bus-line-wrapper">
              <BUS2.SearchBusLineSelect busLineNumber="343" busLineName="Ipiranga Puc" />
            </div>

            <input type="submit" className="search-go" value="Buscar" />
          </form>
        </div>
      </div>
    )
  }
});
