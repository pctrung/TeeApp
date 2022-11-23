namespace TeeApp.Models.RequestModels.PostReport
{
    public class UpdatePostReportRequest
    {
        public int ReportId { get; set; }
        public string Content { get; set; }
        public bool IsHandled { get; set; }
    }
}