using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using UserData.Models;
using System.Linq;
using System.Threading.Tasks;

namespace UserData.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class InsurenceController : ControllerBase
    {
        private readonly InsuranceDbContext _context;

       public InsurenceController(InsuranceDbContext context)
        {
            _context = context;
        }

        [HttpPost("authenticate")]  //login through details
        public async Task<IActionResult> Authenticate(LoginRequest request)
        {
            var user = await _context.Logins.FirstOrDefaultAsync(u => u.Username == request.Username && u.Password == request.Password);

            if (user == null)
            {
                return Unauthorized(); 
            }

            return Ok(new{ user.UserId } ); 
        }

        /* [HttpGet("userdetails/{userId}")]
         public async Task<ActionResult<IEnumerable<UserDetail>>> GetUserDetails(int userId)
         {
             var userDetails = await _context.UserDetails
                 .Where(u => u.UserId == userId)
                 .ToListAsync();

             if (userDetails == null || userDetails.Count == 0)
             {
                 return NotFound();
             }

             return userDetails;
         }*/

        [HttpGet("userdetails/{userId}")] //detail by id
        public async Task<ActionResult<UserDetail>> DetailByID(int userId)
        {
            var userDetails = await _context.UserDetails
                .FirstOrDefaultAsync(u => u.UserId == userId);

            if (userDetails == null)
            {
                return NotFound();
            }

            return userDetails;
        }

        [HttpGet("policies")]  //get policy detail
        public async Task<ActionResult<IEnumerable<Policy>>> GetPolicies()
        {
            var policies = await _context.Policies.ToListAsync();
            if (policies == null || policies.Count == 0)
            {
                return NotFound();
            }
            return policies;
        }

        [HttpGet("userpolicies/{userId}")]  // Get only the PolicyId from UserDetails
        public async Task<ActionResult<IEnumerable<Policy>>> GetUserPolicies(int userId)
        {
            var userPolicies = await _context.UserDetails
                .Where(ud => ud.UserId == userId)
                .Select(ud => ud.PolicyId) 
                .ToListAsync();

            if (userPolicies == null || userPolicies.Count == 0)
            {
                return NotFound();
            }

            var policies = await _context.Policies
                .Where(p => userPolicies.Contains(p.PolicyId)) // Filter using PolicyIds from UserDetails
                .ToListAsync();

            return policies;
        }


        //payment page
        //-------------------------------------------------------

        [HttpGet]  //get payment details
        public async Task<ActionResult<IEnumerable<PaymentDetail>>> GetPaymentDetails()
        {
          if (_context.PaymentDetails == null)
          {
              return NotFound();
          }
            return await _context.PaymentDetails.ToListAsync();
        }

        [HttpGet("{id}")]    //get payment details by id
        public async Task<ActionResult<PaymentDetail>> GetPaymentDetail(int id)
        {
          if (_context.PaymentDetails == null)
          {
              return NotFound();
          }
            var paymentDetail = await _context.PaymentDetails.FindAsync(id);

            if (paymentDetail == null)
            {
                return NotFound();
            }

            return paymentDetail;
        }

 
        [HttpPut("{id}")]   //update payment details by id
        public async Task<IActionResult> PutPaymentDetail(int id, PaymentDetail paymentDetail)
        {
            if (id != paymentDetail.PaymentDetailId)
            {
                return BadRequest();
            }

            _context.Entry(paymentDetail).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PaymentDetailExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return Ok(await _context.PaymentDetails.ToListAsync());
        }

 
        [HttpPost]   //create payment details
        public async Task<ActionResult<PaymentDetail>> PostPaymentDetail(PaymentDetail paymentDetail)
        {
          if (_context.PaymentDetails == null)
          {
              return Problem("Entity set 'PaymentDetailContext.PaymentDetails'  is null.");
          }
            _context.PaymentDetails.Add(paymentDetail);
            await _context.SaveChangesAsync();

            return Ok(await _context.PaymentDetails.ToListAsync());
        }

        [HttpDelete("{id}")]   //delete payment details by id 
        public async Task<IActionResult> DeletePaymentDetail(int id)
        {
            if (_context.PaymentDetails == null)
            {
                return NotFound();
            }
            var paymentDetail = await _context.PaymentDetails.FindAsync(id);
            if (paymentDetail == null)
            {
                return NotFound();
            }

            _context.PaymentDetails.Remove(paymentDetail);
            await _context.SaveChangesAsync();

            return Ok(await _context.PaymentDetails.ToListAsync());
        }

        private bool PaymentDetailExists(int id)
        {
            return (_context.PaymentDetails?.Any(e => e.PaymentDetailId == id)).GetValueOrDefault();
        }



        


    }
}
 