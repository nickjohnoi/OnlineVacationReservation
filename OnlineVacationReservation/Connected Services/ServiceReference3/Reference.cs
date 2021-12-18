﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OnlineVacationReservation.ServiceReference3 {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="ServiceReference3.BookingServiceSoap")]
    public interface BookingServiceSoap {
        
        // CODEGEN: Generating message contract since element name FirstName from namespace http://tempuri.org/ is not marked nillable
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/FlightBooking", ReplyAction="*")]
        OnlineVacationReservation.ServiceReference3.FlightBookingResponse FlightBooking(OnlineVacationReservation.ServiceReference3.FlightBookingRequest request);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/FlightBooking", ReplyAction="*")]
        System.Threading.Tasks.Task<OnlineVacationReservation.ServiceReference3.FlightBookingResponse> FlightBookingAsync(OnlineVacationReservation.ServiceReference3.FlightBookingRequest request);
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class FlightBookingRequest {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="FlightBooking", Namespace="http://tempuri.org/", Order=0)]
        public OnlineVacationReservation.ServiceReference3.FlightBookingRequestBody Body;
        
        public FlightBookingRequest() {
        }
        
        public FlightBookingRequest(OnlineVacationReservation.ServiceReference3.FlightBookingRequestBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class FlightBookingRequestBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=0)]
        public string FirstName;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=1)]
        public string LastName;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=2)]
        public string Phone_Number;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=3)]
        public string Email;
        
        [System.Runtime.Serialization.DataMemberAttribute(Order=4)]
        public int Flight_ID;
        
        [System.Runtime.Serialization.DataMemberAttribute(Order=5)]
        public int Number_of_Seat;
        
        [System.Runtime.Serialization.DataMemberAttribute(EmitDefaultValue=false, Order=6)]
        public string Class;
        
        public FlightBookingRequestBody() {
        }
        
        public FlightBookingRequestBody(string FirstName, string LastName, string Phone_Number, string Email, int Flight_ID, int Number_of_Seat, string Class) {
            this.FirstName = FirstName;
            this.LastName = LastName;
            this.Phone_Number = Phone_Number;
            this.Email = Email;
            this.Flight_ID = Flight_ID;
            this.Number_of_Seat = Number_of_Seat;
            this.Class = Class;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.ServiceModel.MessageContractAttribute(IsWrapped=false)]
    public partial class FlightBookingResponse {
        
        [System.ServiceModel.MessageBodyMemberAttribute(Name="FlightBookingResponse", Namespace="http://tempuri.org/", Order=0)]
        public OnlineVacationReservation.ServiceReference3.FlightBookingResponseBody Body;
        
        public FlightBookingResponse() {
        }
        
        public FlightBookingResponse(OnlineVacationReservation.ServiceReference3.FlightBookingResponseBody Body) {
            this.Body = Body;
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
    [System.Runtime.Serialization.DataContractAttribute(Namespace="http://tempuri.org/")]
    public partial class FlightBookingResponseBody {
        
        [System.Runtime.Serialization.DataMemberAttribute(Order=0)]
        public int FlightBookingResult;
        
        public FlightBookingResponseBody() {
        }
        
        public FlightBookingResponseBody(int FlightBookingResult) {
            this.FlightBookingResult = FlightBookingResult;
        }
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface BookingServiceSoapChannel : OnlineVacationReservation.ServiceReference3.BookingServiceSoap, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class BookingServiceSoapClient : System.ServiceModel.ClientBase<OnlineVacationReservation.ServiceReference3.BookingServiceSoap>, OnlineVacationReservation.ServiceReference3.BookingServiceSoap {
        
        public BookingServiceSoapClient() {
        }
        
        public BookingServiceSoapClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public BookingServiceSoapClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public BookingServiceSoapClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public BookingServiceSoapClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        OnlineVacationReservation.ServiceReference3.FlightBookingResponse OnlineVacationReservation.ServiceReference3.BookingServiceSoap.FlightBooking(OnlineVacationReservation.ServiceReference3.FlightBookingRequest request) {
            return base.Channel.FlightBooking(request);
        }
        
        public int FlightBooking(string FirstName, string LastName, string Phone_Number, string Email, int Flight_ID, int Number_of_Seat, string Class) {
            OnlineVacationReservation.ServiceReference3.FlightBookingRequest inValue = new OnlineVacationReservation.ServiceReference3.FlightBookingRequest();
            inValue.Body = new OnlineVacationReservation.ServiceReference3.FlightBookingRequestBody();
            inValue.Body.FirstName = FirstName;
            inValue.Body.LastName = LastName;
            inValue.Body.Phone_Number = Phone_Number;
            inValue.Body.Email = Email;
            inValue.Body.Flight_ID = Flight_ID;
            inValue.Body.Number_of_Seat = Number_of_Seat;
            inValue.Body.Class = Class;
            OnlineVacationReservation.ServiceReference3.FlightBookingResponse retVal = ((OnlineVacationReservation.ServiceReference3.BookingServiceSoap)(this)).FlightBooking(inValue);
            return retVal.Body.FlightBookingResult;
        }
        
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Advanced)]
        System.Threading.Tasks.Task<OnlineVacationReservation.ServiceReference3.FlightBookingResponse> OnlineVacationReservation.ServiceReference3.BookingServiceSoap.FlightBookingAsync(OnlineVacationReservation.ServiceReference3.FlightBookingRequest request) {
            return base.Channel.FlightBookingAsync(request);
        }
        
        public System.Threading.Tasks.Task<OnlineVacationReservation.ServiceReference3.FlightBookingResponse> FlightBookingAsync(string FirstName, string LastName, string Phone_Number, string Email, int Flight_ID, int Number_of_Seat, string Class) {
            OnlineVacationReservation.ServiceReference3.FlightBookingRequest inValue = new OnlineVacationReservation.ServiceReference3.FlightBookingRequest();
            inValue.Body = new OnlineVacationReservation.ServiceReference3.FlightBookingRequestBody();
            inValue.Body.FirstName = FirstName;
            inValue.Body.LastName = LastName;
            inValue.Body.Phone_Number = Phone_Number;
            inValue.Body.Email = Email;
            inValue.Body.Flight_ID = Flight_ID;
            inValue.Body.Number_of_Seat = Number_of_Seat;
            inValue.Body.Class = Class;
            return ((OnlineVacationReservation.ServiceReference3.BookingServiceSoap)(this)).FlightBookingAsync(inValue);
        }
    }
}