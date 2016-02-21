BUS2.SearchView = React.createClass({
  render: function () {
    return (
      <div className="bus2-search-wrapper">
        <h2>Encontre seu ônibus em tempo real</h2>
        <form action="">
          <BUS2.SearchInput className="search-input" id="country" placeholder="Selecione um país" />
          <BUS2.SearchInput className="search-input" id="state" placeholder="Selecione um estado" />
          <BUS2.SearchInput className="search-input" id="city" placeholder="Selecione uma cidade" />

          <a className="share-gps">Compartilhe sua localização</a>

          <BUS2.SearchInput className="search-input" id="line" placeholder="SELECIONE UMA LINHA" />

          <div className="bus-line-wrapper">
            <BUS2.SearchBusLineSelect busLineNumber="343" busLineName="Ipiranga Puc" />
          </div>

          <input type="submit" className="search-go" value="Buscar" />
        </form>
      </div>
    )
  }
});
