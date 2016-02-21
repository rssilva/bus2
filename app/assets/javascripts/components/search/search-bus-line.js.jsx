BUS2.SearchBusLineSelect = React.createClass({
  render: function () {
    return (
      <div className="bus-line-select">
        <span>{this.props.busLineNumber} - </span>
        <span>{this.props.busLineName}</span>
        <a className="unselect">X</a>
      </div>
    )
  }
});
